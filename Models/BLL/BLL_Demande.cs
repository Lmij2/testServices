using AdminServiceGBO.Models.DAL;
using AdminServiceGBO.Models.Entities;
using MyUtilities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace AdminServiceGBO.Models.BLL
{
    public class BLL_Demande
    {

        static string PathGBO = Directory.GetCurrentDirectory();

        public static void CheckNameUnicityEmail(string Email)
        {

            DAL_Demande.selectByField("email", Email);

        }
        
        public static void CheckNameUnicityName(string Name)
        {

            DAL_Demande.selectByField("name", Name);

        }

        public static void Add(Demande demande)
        {
            DAL_Demande.AddDemande(demande);
        }

        public static void Update(long id, Demande demande, string OrganizationSystemPrefix)
        {

            long newOrgId = 0;
            long Iduser = 0;

            bool OrgCreated = false, UserCreated = false, DbCreated = false;

            if (demande.RegDemandDecision.Trim().ToLower().Equals("refuse"))
                DAL_Demande.UpdateDemande(id, demande);

            else if (demande.RegDemandDecision.Trim().ToLower().Equals("accepte"))
            {
                try
                {
                    Organization newOrganization = new Organization(
                    0, demande.Name, "", "", "", demande.Affiliation, "", demande.FieldOfActivity, demande.Adress,
                    demande.PostalCode, demande.City, demande.Country, demande.Email, demande.Phone,
                    demande.PersonToContact, demande.ContactMail, demande.ContactPhone, demande.ContactPosition,
                    "", "", "", "", "essai", "inactive", OrganizationSystemPrefix);

                    newOrgId = BLL_Organization.Add(newOrganization);
                    if (newOrgId > 0)
                        OrgCreated = true;
                    else
                        throw new MyException("Erreur Base De Données", "Erreur Lors de la creation de l'organisation", "BLL");


                    User AdminOrg = new User(0, newOrgId, "admin" + newOrganization.NameFr.ToUpper(), newOrganization.Email,
                        "1", "admin", DateTime.Now, "", "", demande.Email, "");

                    Iduser = BLL_User.Add(AdminOrg);
                    if (Iduser > 0)
                        UserCreated = true;
                    else
                        throw new MyException("Erreur Base De Données", "Erreur Lors de la creation du nouveau utilisateur", "BLL");

                    string responseCreationDB = CreateDatabaseIfNotExists(OrganizationSystemPrefix + "DB");
                    if (responseCreationDB == null)
                        DbCreated = true;
                    else
                        throw new MyException("Erreur Base De Données", "Erreur Creation de la base de données : " + responseCreationDB, "BLL");
                    try
                    {
                        CreateFolderGBO(OrganizationSystemPrefix + "Docs");
                    }
                    catch (Exception ex){}

                    DAL_Demande.UpdateDemande(id, demande);
                }
                catch (Exception ex)
                {
                    if (DbCreated)
                            DeleteDatabaseIfExists(OrganizationSystemPrefix + "DB");

                    if (UserCreated)
                            BLL_User.Delete(Iduser);

                    if (OrgCreated)
                            BLL_Organization.Delete(newOrgId);
                    
                    throw ex;
                }
            }
            else
                throw new MyException("Erreur Requete", "Decision non correcte, essayez encore", "BLL");
        }

        public static bool CreateFolderGBO(string PrefixFolder)
        {
            try
            {
                var Path = Directory.GetCurrentDirectory() + @"\Folders\" + PrefixFolder;
                DirectoryInfo di = Directory.CreateDirectory(Path);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public static bool DeleteFolderGBO(string PrefixFolder)
        {
            try
            {
                var Path = PathGBO + @"\Folders\" + PrefixFolder;
                new DirectoryInfo(PrefixFolder).Delete();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static string CreateDatabaseIfNotExists(string OrganizationSystemPrefix)
        {
            return DAL_Demande.CreateDatabaseIfNotExists(OrganizationSystemPrefix);
        }

        public static string DeleteDatabaseIfExists(string OrganizationSystemPrefix)
        {
            return DAL_Demande.DeleteDatabaseIfExists(OrganizationSystemPrefix);
        }


        public static void Delete(long id)
        {
            DAL_Demande.DeleteDemande(id);
        }
        
        public static Demande SelectById(long id)
        {
            return DAL_Demande.selectByField("Id", "" + id);
        }

        public static List<Demande> SelectAll()
        {
            return DAL_Demande.selectAll();
        }

    }
}
