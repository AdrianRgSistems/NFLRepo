using Microsoft.EntityFrameworkCore.Migrations;

namespace NFL.Server.Migrations
{
    public partial class addroles : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "3826fd2b-4536-49b8-a378-f97b76d54e71", "50db14cc-90cf-4e5c-8834-288fb798fe57", "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "c71e5ce5-d6d0-4024-b670-889256c8e4a9", "1160395a-f216-4b40-9527-a4dfa104a268", "user", "USER" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "3826fd2b-4536-49b8-a378-f97b76d54e71");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "c71e5ce5-d6d0-4024-b670-889256c8e4a9");
        }
    }
}
