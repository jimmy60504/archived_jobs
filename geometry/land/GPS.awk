# usage  awk -f GPS.awk line.prn > line.gps
# line.prn columns: station, distence, x_coord, y_coord, elev
{
    s2=$1
    dist[s2] = $2
    x[s2] = $3
    y[s2] = $4
    z[s2] = $5
    if ($1 != 1){
        n=s2-s1
        dd=(dist[s2]-dist[s1])/n
        dx=(x[s2]-x[s1])/n
        dy=(y[s2]-y[s1])/n
        dz=(z[s2]-z[s1])/n
        for ( i=1; i<n; i++){
    printf ("%10d %10d %12.2f %12.2f %8.2f \n",s1+i, dist[s1]+i*dd, x[s1]+i*dx, y[s1]+i*dy, z[s1]+i*dz)
        }   
    }
#    printf ("\n")
#    printf ("%10f %10f %10f %10f %10f \n", n, dd, dx, dy, dz)
    printf ("%10d %10d %12.2f %12.2f %8.2f \n",s2, dist[s2], x[s2], y[s2], z[s2])

    s1=s2
    dist[s1] = dist[s2]
    x[s1] = x[s2]
    y[s1] = y[s2]
    z[s1] = z[s2]
}
