resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.ec2_type
  key_name               = var.sshkey
  vpc_security_group_ids = [aws_security_group.sg.id]

  subnet_id                   = [for subnet in aws_subnet.subnet : subnet.id][0]
  associate_public_ip_address = var.public_adress
  source_dest_check           = "false"
  user_data                   = var.user_data
  tags                        = merge(var.default_tags, local.module_tags)
}

resource "aws_security_group" "sg" {
  name   = "${var.project_name}_${var.product_name}_${var.function}"
  vpc_id = var.vpc_id

  tags = merge(var.default_tags, local.module_tags)
}

resource "aws_security_group_rule" "sg_rule" {
  for_each          = var.network_rules
  type              = element(each.value, 0)
  from_port         = element(each.value, 1)
  to_port           = element(each.value, 2)
  protocol          = element(each.value, 3)
  cidr_blocks       = [element(each.value, 4)]
  security_group_id = aws_security_group.sg.id
}

resource "aws_subnet" "subnet" {
  for_each                = var.subnet_metadata
  availability_zone       = each.value
  cidr_block              = each.key
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = true
  tags                    = merge(var.default_tags, local.module_tags)
}

resource "aws_route_table_association" "association" {
  count          = length(aws_subnet.subnet)
  subnet_id      = aws_subnet.subnet[element(keys(var.subnet_metadata), count.index)].id
  route_table_id = var.rt_id
}

resource "aws_cloudwatch_metric_alarm" "instance_cpu_usage" {
  alarm_name          = "${var.project_name}_${var.product_name}_${var.function}_cpu_usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUCreditUsage"
  namespace           = "AWS/EC2"
  period              = "3600"
  statistic           = "Sum"
  threshold           = var.CPUCreditUsage_per_hour
  alarm_description   = ""
  alarm_actions       = [var.sns_arn]
  dimensions = {
    InstanceId = aws_instance.instance.id
  }
}

resource "aws_cloudwatch_metric_alarm" "instance_cpu_balance" {
  alarm_name          = "${var.project_name}_${var.product_name}_${var.function}_cpu_balance"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUCreditBalance"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.minimum_cpu_balance
  alarm_description   = ""
  alarm_actions       = [var.sns_arn]
  dimensions = {
    InstanceId = aws_instance.instance.id
  }
}
