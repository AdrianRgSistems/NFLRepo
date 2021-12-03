using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NFL.Client.Helpers
{
    public class StateContainer
    {
        public event Action UpdateStateAsync;
        public void UpdateState()
        {
            UpdateStateAsync?.Invoke();
        }
    }
}
