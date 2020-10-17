using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    [WebMethod]
    public static string getAns(int num_1 , int num_2 , char cal_type , double ans_input)
    {
        int ans_trans=(int)Math.Floor(ans_input*100) ;
        double res=0.0 ;  

        switch (cal_type) {
            case '+':
                res=num_1+num_2 ;
                break;
            case '-' :
                res=num_1-num_2 ;
                break;
            case '*' :
                res=num_1*num_2 ;
                break ;
            case '/' :
                res=(double)((double)num_1/(double)num_2) ;
                break ;
        }
        const double eps=0.000007 ;
        int res_trans=(int)Math.Floor(res*100) ;
        /*if (Math.Abs(ans_input-ans) <= eps) {
            return "true" ;
        } else {
            return "false" ;
        }*/
        if (ans_trans==res_trans) {
            return "true" ;
        } else {
            return "false" ;
        }
    } 
}