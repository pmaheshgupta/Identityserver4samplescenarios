using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using IdentityModel.Client;
using System.Net.Http;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace WebClient.Controllers
{
    public class Security : Controller
    {
        // GET: /<controller>/
        public async Task<TokenResponse> GetTokenAsync()
        {
            DiscoveryResponse disco = await DiscoveryClient.GetAsync("http://localhost:5000");
            TokenClient tokenClient = new TokenClient(disco.TokenEndpoint, "client", "secret");
            IdentityModel.Client.TokenResponse tokenResponse = await tokenClient.RequestClientCredentialsAsync("api1");

            if (tokenResponse.IsError)
            {
                Console.WriteLine(tokenResponse.Error);
                
            }
            return tokenResponse;
        }


        public async Task<string> CallWebApi_CC_TokenAsync()
        {
            DiscoveryResponse disco = await DiscoveryClient.GetAsync("http://localhost:5000");




            TokenClient tokenClient = new TokenClient(disco.TokenEndpoint, "client", "secret");
            IdentityModel.Client.TokenResponse tokenResponse = await tokenClient.RequestClientCredentialsAsync("api1");





            if (tokenResponse.IsError)
            {
                Console.WriteLine(tokenResponse.Error);

            }
            var client = new HttpClient();
           client.SetBearerToken(tokenResponse.AccessToken);

            HttpResponseMessage response = await client.GetAsync("http://localhost:5001/identity");
            string content = string.Empty;
            if (response.IsSuccessStatusCode)           
            {
                content = await response.Content.ReadAsStringAsync();       
            }
            return content;
        }

        [HttpGet]
        public async Task<string> CallWebApi_RO_TokenAsync(string uname,string pwd)
        {
            DiscoveryResponse disco = await DiscoveryClient.GetAsync("http://localhost:5000");
            TokenClient tokenClient = new TokenClient(disco.TokenEndpoint, "ro.client", "secret");
            
            IdentityModel.Client.TokenResponse tokenResponse = await tokenClient.RequestResourceOwnerPasswordAsync("alice", "password", "api1");

            if (tokenResponse.IsError)
            {
                Console.WriteLine(tokenResponse.Error);
            }
            var client = new HttpClient();
            client.SetBearerToken(tokenResponse.AccessToken);
            HttpResponseMessage response = await client.GetAsync("http://localhost:5001/identity");
            string content = string.Empty;
            if (response.IsSuccessStatusCode)
            {
                content = await response.Content.ReadAsStringAsync();
            }
            return content;

        }
    }
}
