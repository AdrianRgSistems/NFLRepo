﻿using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NFL.Server.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string fullname { get; set; }
    }
}
