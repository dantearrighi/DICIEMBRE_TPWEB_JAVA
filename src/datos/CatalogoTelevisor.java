package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Televisor;



public class CatalogoTelevisor {

	

	public int AddTelev(Televisor TeleModel)
	{
		try{
			
		String SQLCons= "INSERT INTO Electrodomestico (descripcion, color_elect, consumo_elect, peso_elect ,precio_elect, Sintoniz_tele, Resol_tele)"+ " VALUES (?,?,?,?,?,?,?)";
		ConexionBD conecta = new ConexionBD();
		conecta.OpenConection();
		PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
		stmt.setString(1,TeleModel.getDescripcion());
		stmt.setString(2, TeleModel.getColor());
		stmt.setFloat(5, TeleModel.getPreciobase());
		stmt.setFloat(4, TeleModel.getPeso());
		stmt.setObject(3, TeleModel.getConsumoEnergetico(),java.sql.Types.CHAR);
		stmt.setInt(7,TeleModel.getPulgadas());

		stmt.setBoolean(6, TeleModel.isSintonizadorTDT());


			stmt.execute(); 
			conecta.CloseConnection();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return Statement.RETURN_GENERATED_KEYS;
	}
	public void DeleteTelev(int pIdElec)
	{
		String SQLCons= "DELETE FROM Electrodomestico where ?=id_electro";
		try {
			ConexionBD conecta = new ConexionBD();
			conecta.OpenConection();
			PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
			stmt.setInt(1, pIdElec);
			int rta = stmt.executeUpdate();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		}
	public int UpdateTelev (Televisor Telev)
	{
		String SQLCons= "UPDATE Electrodomestico SET color_elect=? , consumo_elect=?, precio_elect=?, peso_elect=?, Sintoniz_tele=?, Resol_tele=?, descripcion=? WHERE ?=id_electro";
		try{
		ConexionBD conecta = new ConexionBD();
		conecta.OpenConection();
		PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
		stmt.setString(1, Telev.getColor());
		stmt.setObject(2, Telev.getConsumoEnergetico(),java.sql.Types.CHAR);
		stmt.setFloat(3, Telev.getPreciobase());
		stmt.setFloat(4, Telev.getPeso());
		stmt.setBoolean(5, Telev.isSintonizadorTDT());
		stmt.setInt(6, Telev.getPulgadas());
		stmt.setString(7, Telev.getDescripcion());
		stmt.setInt(8, Telev.getIdElect());
		int rta = stmt.executeUpdate();
		}		
				 catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return Statement.RETURN_GENERATED_KEYS;
	}
	public ArrayList<Televisor> GetAllTele()
	{
		
		ArrayList<Televisor> ElectroDevArray = new ArrayList<Televisor>();
		try {
			
			
			String SQLCons= "Select id_electro, descripcion, color_elect, consumo_elect, peso_elect, Resol_tele, Sintoniz_tele, precio_elect FROM Electrodomestico WHERE Resol_tele is not null ORDER BY descripcion";
			ConexionBD conecta = new ConexionBD();
			conecta.OpenConection();
			PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
			ResultSet rta = stmt.executeQuery();
		
					 	while(rta.next())
						{			Televisor ElectroDev = new Televisor();
									ElectroDev.setDescripcion(rta.getString("descripcion"));
									ElectroDev.setColor(rta.getString("color_elect"));							
									ElectroDev.setConsumoEnergetico(rta.getString("consumo_elect").charAt(0));
									ElectroDev.setIdElect(rta.getInt("id_electro")); 
									ElectroDev.setPreciobase(rta.getFloat("precio_elect"));
									ElectroDev.setPeso(rta.getFloat("peso_elect"));
									ElectroDev.setPulgadas(rta.getInt("Resol_tele"));
									ElectroDev.setSintonizadorTDT(rta.getBoolean("Sintoniz_tele"));
						ElectroDevArray.add(ElectroDev);
									// rta.next(); el que hizo esto se la mando
						}
								
								} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						return ElectroDevArray;}
	
	
	public Televisor GetOne(int pId)
	{
		Televisor ElectroDev = new Televisor();
		try
		{
		String SQLCons= "SELECT * FROM Electrodomestico WHERE id_electro=?";
		ConexionBD conecta = new ConexionBD();
		conecta.OpenConection();
		PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
		stmt.setInt(1, pId);
						
		
		ResultSet rta = stmt.executeQuery();
		while(rta.next())
		{				
						
						ElectroDev.setColor(rta.getString("color_elect"));
						ElectroDev.setDescripcion(rta.getString("descripcion"));
						ElectroDev.setConsumoEnergetico(rta.getString("consumo_elect").charAt(0));
						ElectroDev.setIdElect(rta.getInt("id_electro"));
						ElectroDev.setPreciobase(rta.getFloat("precio_elect"));
						ElectroDev.setPeso(rta.getFloat("peso_elect"));
						ElectroDev.setSintonizadorTDT(rta.getBoolean("Sintoniz_tele"));
						ElectroDev.setPulgadas(rta.getInt("Resol_tele"));
		}
						rta.close();
						stmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
								}
		
		return ElectroDev;		
	}

	public ArrayList<Televisor> GetXConsumoTele (char pConsumo)
	{
		ArrayList<Televisor> ElectroDevArray = new ArrayList<Televisor>();
		try {
			
			
			String SQLCons= "Select * FROM Electrodomestico WHERE (carga_lava is not null AND consumo_elect="+pConsumo+"ORDER BY descripcion";
			ConexionBD conecta = new ConexionBD();
			conecta.OpenConection();
			PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
			stmt.setString(1, Character.toString(pConsumo));
			ResultSet rta = stmt.executeQuery();
		
					 	while(rta.next())
						{			Televisor ElectroDev = new Televisor();
									ElectroDev.setDescripcion(rta.getNString("descripcion"));
									ElectroDev.setColor(rta.getNString("color_elect"));							
									ElectroDev.setConsumoEnergetico(rta.getString("consumo_elect").charAt(0));
									ElectroDev.setIdElect(rta.getInt("id_electro")); 
									ElectroDev.setPreciobase(rta.getFloat("precio_elect"));
									ElectroDev.setPeso(rta.getFloat("peso_elect"));
									ElectroDev.setPulgadas(rta.getInt("Resol_tele"));
									ElectroDev.setSintonizadorTDT(rta.getBoolean("Sintoniz_tele"));
						ElectroDevArray.add(ElectroDev);
									rta.next();
						}
								
								} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						return ElectroDevArray;}
				
		
	
	public ArrayList<Televisor> GetXPreciosTele(float pMin, float pMax)
					{
					
					ArrayList<Televisor> ElectroDevArray = new ArrayList<Televisor>();
					try {
					String SQLCons= "Select * FROM Electrodomestico WHERE (precio>=? AND precio<=? AND Resol_tele is not null)ORDER BY descripcion";
					ConexionBD conecta = new ConexionBD();
					conecta.OpenConection();
					PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
					stmt.setFloat(1, pMin);
					stmt.setFloat(2, pMax);
					ResultSet rta = stmt.executeQuery();
					
					while(rta.next())
					{
						Televisor ElectroDev = new Televisor();
											ElectroDev.setDescripcion(rta.getNString("descripcion"));
											ElectroDev.setColor(rta.getNString("color_elect"));							
											ElectroDev.setConsumoEnergetico(rta.getString("consumo_elect").charAt(0));
											ElectroDev.setIdElect(rta.getInt("id_electro")); 
											ElectroDev.setPreciobase(rta.getFloat("precio_elect"));
											ElectroDev.setPeso(rta.getFloat("peso_elect"));
											ElectroDev.setPulgadas(rta.getInt("Resol_tele"));
											ElectroDev.setSintonizadorTDT(rta.getBoolean("Sintoniz_tele"));
											ElectroDevArray.add(ElectroDev);
						}
											} catch (SQLException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
								return ElectroDevArray;	}
							
					

					
						
					
	public ArrayList<Televisor> GetxPrecioYConsumoTele(float pMin, float pMax, char pConsumo)
		{
		
		ArrayList<Televisor> ElectroDevArray = new ArrayList<Televisor>();
		try {
		String SQLCons= "Select * FROM Electrodomestico WHERE (precio>=? AND precio<=? AND consumo_elect=? AND Resol_tele is not null)ORDER BY descripcion";
		ConexionBD conecta = new ConexionBD();
		conecta.OpenConection();
		PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
		stmt.setFloat(1, pMin);
		stmt.setFloat(2, pMax);
		stmt.setString(3, Character.toString(pConsumo));
		ResultSet rta = stmt.executeQuery();
		
		while(rta.next())
		{
			Televisor ElectroDev = new Televisor();
								ElectroDev.setDescripcion(rta.getNString("descripcion"));
								ElectroDev.setColor(rta.getNString("color_elect"));							
								ElectroDev.setConsumoEnergetico(rta.getString("consumo_elect").charAt(0));
								ElectroDev.setIdElect(rta.getInt("id_electro")); 
								ElectroDev.setPreciobase(rta.getFloat("precio_elect"));
								ElectroDev.setPeso(rta.getFloat("peso_elect"));
								ElectroDev.setPulgadas(rta.getInt("Resol_tele"));
								ElectroDev.setSintonizadorTDT(rta.getBoolean("Sintoniz_tele"));
								ElectroDevArray.add(ElectroDev);
			}
								} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					return ElectroDevArray;	}
}
