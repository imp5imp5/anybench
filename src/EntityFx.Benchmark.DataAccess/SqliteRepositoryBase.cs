﻿using Microsoft.Data.Sqlite;
using System;
using System.Data;
using System.IO;

namespace EntityFx.Benchmark.DataAccess
{
    public class SqliteRepositoryBase : ISqliteRepository
    {
        protected static string ConnectionString;
        public static string FileNameInternal;

        public static readonly Lazy<IDbConnection> ConnectionLazy = new Lazy<IDbConnection>(() =>
        {
            return new SqliteConnection(ConnectionString);
        });

        private static object _stdLock = new { };


        public static IDbConnection Connection
        {
            get
            {
                lock (_stdLock)
                {
                    var connection = ConnectionLazy.Value;
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    return connection;
                }
            }
        }

        public SqliteRepositoryBase()
        {
            ConnectionString = $"Data Source={FileNameInternal};Version=3;";

            if (!File.Exists(FileName))
            {
                CreateDatabase();
            }
        }

        protected void CreateDatabase()
        {
            File.Create(FileName);

            //Connection.Open();
        }

        public virtual string FileName
        {
            get => FileNameInternal;
            set => FileNameInternal = value;
        }
    }
}