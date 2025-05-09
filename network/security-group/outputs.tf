output "eks_sg_id" {
  value = aws_security_group.eks.id
}

output "db_sg_id" {
  value = aws_security_group.db.id
}

output "s3_sg_id" {
  value = aws_security_group.s3.id
}
