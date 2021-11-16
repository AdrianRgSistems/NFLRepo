using System;
using System.Collections.Generic;

namespace NFL.Server.Models
{
    public partial class ForecastDetail
    {
        public int Id { get; set; }
        /// <summary>
        /// lla ve foranea de pronostico
        /// </summary>
        public int? ForecastId { get; set; }
        /// <summary>
        /// identificador de juego
        /// </summary>
        public int? Game { get; set; }
        /// <summary>
        /// id del equipo ganador
        /// </summary>
        public string Win { get; set; }
        /// <summary>
        /// establece si la prediccion se completo
        /// </summary>
        public int? Set { get; set; }
        /// <summary>
        /// define si el pronostico fue correcto
        /// </summary>
        public int? IsCorrect { get; set; }

        public virtual Forecast Forecast { get; set; }
        public virtual Game GameNavigation { get; set; }
        public virtual Team WinNavigation { get; set; }
    }
}
