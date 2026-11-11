# Script: tong_hop.ps1
# Tac gia: Vũ Đức Việt Anh
# Ngay tao: 11/11/2026
Write-Host "Dang tao bao cao.."
"=== BAO CAO SU CO WEBSITE ===" > logs/tong_hop.txt
Get-content logs/member.log | select-string "404" >> logs/tong_hop.txt
Get-content logs/member.log | select-string "500" | measure-object >> logs/tong_hop.txt
Write-Host "Hoan thanh"