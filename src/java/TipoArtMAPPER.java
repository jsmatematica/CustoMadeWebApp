
import customade2.Entidades.TipoArticulo;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jsmat
 */
public class TipoArtMAPPER {
    public static final TipoArticulo StringToType(String tipo){
        
        TipoArticulo result = null;
        switch (tipo){
            case "TAZA":
                result = TipoArticulo.TAZA;
                break;
            case "BUZOHOMBRE":
                result = TipoArticulo.BUZOHOMBRE;
                break;
            case "BUZOMUJER":
                result = TipoArticulo.BUZOMUJER;
                break;
            case "CAMISETAHOMBRE":
                result = TipoArticulo.CAMISETAHOMBRE;
                break;
            case "CAMISETAMUJER":
                result = TipoArticulo.CAMISETAMUJER;
                break;
            case "CAMPERAHOMBRE":
                result = TipoArticulo.CAMPERAHOMBRE;
                break;
            case "CAMPERAMUJER":
                result = TipoArticulo.CAMPERAMUJER;
                break;
        }
        
        return result;
    
    }
    
    public static final String TypeToString(TipoArticulo tipo){
    
        String result = "";
        
        switch(tipo){
        
            case TAZA:
                result = "TAZA";
                break;
            case BUZOHOMBRE:
                result = "BUZOHOMBRE";
                break;
            case BUZOMUJER:
                result = "BUZOMUJER";
                break;
            case CAMISETAHOMBRE:
                result = "CAMISETAHOMBRE";
                break;
            case CAMISETAMUJER:
                result = "CAMISETAMUJER";
                break;
            case CAMPERAHOMBRE:
                result = "CAMPERAHOMBRE";
                break;
            case CAMPERAMUJER:
                result = "CAMPERAMUJER";
                break;
        
        
        }
        
        return result;
    
        
    }
    
}
