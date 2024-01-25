<?php 
    require_once 'login.php';
    session_start();
    $conexion = new mysqli($hn, $un, $pw, $db, $port);
   
    if ($conexion->connect_error) die ("Fatal error");
    if (isset($_SESSION['nombre']))
    {

    if (isset($_POST['delete']) && isset($_POST['titulo']))
    {   
        $titulo = get_post($conexion, 'titulo');
        $query = "DELETE FROM tarea WHERE titulo='$titulo'";
        $result = $conexion->query($query);
        if (!$result) echo "BORRAR falló"; 
    }
    $nombre = htmlspecialchars($_SESSION['nombre']);
    $username = htmlspecialchars($_SESSION['username']);
    echo "<h1> Todas Las Tareas Archivados de $nombre </h1>" ;
    echo " Menú de tareas: ";
    echo "<a href=pendientes.php>Pendientes</a>  ";
    echo "<a href=Tarea_vencida.php>Tareas vencidas</a>  ";
    echo "<a href=Tarea_Archivada.php>Tareas Archivadas</a>  ";
    echo "<a href=Todas_las_Tareas.php>Todas las tareas</a> <br>  ";
    echo "<br>";

    $query = "SELECT * FROM tarea WHERE usuario = '$username' and categoria='archivado'";
    $result = $conexion->query($query);
    if (!$result) die ("Falló la consulta ");
     
   
    $rows = $result->num_rows;

    for ($j = 0; $j < $rows; $j++)
    {
        $row = $result->fetch_array(MYSQLI_NUM);

        $r0 = htmlspecialchars($row[0]);
        $r1 = htmlspecialchars($row[1]);
        $r2 = htmlspecialchars($row[2]);
        $r3 = htmlspecialchars($row[3]);
        $r4 = htmlspecialchars($row[4]);
        $r5 = htmlspecialchars($row[5]);
        
        echo <<<_END
        <TH>
        <TABLE BORDER=2 bordercolor="lightslategray" >
          <TR>
          <TH>Título </TH> <TH>Contenido</TH> <TH>Fecha_de_Registro </TH><TH>Fecha de Vencimiento </TH><TH>categoria</TH>
          </TR>
          <TD>$r1</TD> <TD>$r2</TD> <TD>$r3</TD> <TD>$r4</TD><TD>$r5</TD>
        </TABLE>
        <form action='Tarea_Archivada.php' method='post'>
        <input type='submit' value='Eliminar tarea'>
        <input type='hidden' name='delete' value='yes'>
        <input type='hidden' name='titulo' value='$r1'>
        </form>
        _END;
    }
    echo "<a href=añadir.php>Añadir tareas  </a>  <br>";
    echo "<a href=cerrar_sesion.php> cerrar sesion </a> ";
    $result->close();
    $conexion->close();

     }else echo " usted no inicio sesion <a href=iniciar_sesion.php>Click aqui</a> para ingresar";


    function get_post($con, $var)
    {
        return $con->real_escape_string($_POST[$var]);
    }
    
?>
