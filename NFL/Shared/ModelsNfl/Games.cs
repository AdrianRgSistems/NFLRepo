using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NFL.Shared.ModelsNfl
{
    public class Games
    {
        public IEnumerable<GameNFL> games { get; set; }
        public Pagination pagination { get; set; }

    }
}
