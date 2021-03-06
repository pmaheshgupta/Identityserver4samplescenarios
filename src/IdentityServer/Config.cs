﻿using IdentityServer4;
using IdentityServer4.Models;
using IdentityServer4.Test;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IdentityServer
{
    public class Config
    {
        public static IEnumerable<ApiResource> GetApiResources()
        {
            return new List<ApiResource>{
               new ApiResource("api1", "My API") };
        }

        // public static List<TestUser> GetUsers()
        // {
        //     return new List<TestUser>
        // {
        // new TestUser
        //  {
        //     SubjectId = "1",
        //     Username = "alice",
        //     Password = "password"
        // },
        // new TestUser
        // {
        //     SubjectId = "2",
        //     Username = "bob",
        //     Password = "password"
        // }
        //};
        // }

        public static IEnumerable<Client> GetClients()
        {
            List<Client> clients = new List<Client>();

            clients.Add(new Client
            {
                ClientId = "client",
                // no interactive user, use the clientid/secret for authentication
                AllowedGrantTypes = GrantTypes.ClientCredentials,
                // secret for authentication
                ClientSecrets =
            {
                new Secret("secret".Sha256())
            },
                // scopes that client has access to
                AllowedScopes = { "api1" }
            });


            clients.Add(new Client
            {
                ClientId = "ro.client",
                AllowedGrantTypes = GrantTypes.ResourceOwnerPassword,

                ClientSecrets =
            {
                new Secret("secret".Sha256())
            },
                AllowedScopes = { "api1" }
            });


            clients.Add(new Client
            {
                ClientId = "mvc",
                ClientName = "MVC Client",
                ClientSecrets =
            {
                new Secret("secret".Sha256())
            },
                AllowedGrantTypes = GrantTypes.HybridAndClientCredentials,
                RequireConsent = false,
                // where to redirect to after login
                RedirectUris = { "http://localhost:5002/signin-oidc" },

                // where to redirect to after logout
                PostLogoutRedirectUris = { "http://localhost:5002" },

                AllowedScopes = new List<string>
            {
                IdentityServerConstants.StandardScopes.OpenId,
                IdentityServerConstants.StandardScopes.Profile,
                "api1"
            }
            });


            clients.Add(new Client
            {
                ClientId = "jswebclient",
                ClientName = "JavaScript Client",
                AllowedGrantTypes = GrantTypes.Implicit,
                AllowAccessTokensViaBrowser = true,
                RequireConsent = false,
                RedirectUris = { "http://localhost:5003/callback.html" },
                
                PostLogoutRedirectUris = { "http://localhost:5003/index.html" },
                AllowedCorsOrigins = { "http://localhost:5003" },

                AllowedScopes =
                  {
        IdentityServerConstants.StandardScopes.OpenId,
        IdentityServerConstants.StandardScopes.Profile,
        "api1"
                    }
            });

            return clients;
        }

        public static IEnumerable<IdentityResource> GetIdentityResources()
        {
            return new List<IdentityResource>
    {
        new IdentityResources.OpenId(),
        new IdentityResources.Profile(),

    };
        }
    }
}
