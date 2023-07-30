# --- networking/outputs.tf ---

output "vpc_id" {
    value = aws_vpc.gog_vpc.id
}