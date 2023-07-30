CREATE TABLE [job_opportunity] (
    [Id] INT NOT NULL,
    [Company_id] INT NOT NULL,
    [Location_id] INT NOT NULL,
    [Country_id] INT NOT NULL,
    [Job_Type] VARCHAR(50) NOT NULL CHECK ([Job_Type] IN ('Full Time', 'Part Time')),
    [Experience_level] VARCHAR(50) NOT NULL CHECK ([Experience_level] IN ('Senior-level','Mid-level','Entry-level','Not-Specified','Executive-level')),
    [AVG_Salary] FLOAT NOT NULL,
    [Negotiation] BIT NOT NULL,
    [custom_asterisk] BIT NOT NULL,
    [job_role] VARCHAR(50) NOT NULL CHECK ([job_role] IN ('data scientist','data engineer','data Analyste','IA','big data','other')),
    CONSTRAINT [PK_job_opportunity] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [Company] (
    [Id] INT NOT NULL,
    [Name] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [Location] (
    [Id] INT NOT NULL,
    [Full_location] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [Country] (
    [id] INT NOT NULL,
    [Country_name] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([id] ASC)
)

CREATE TABLE [Requirment_of_the_company] (
    [Id] INT NOT NULL,
    [Name] VARCHAR(1000) NOT NULL,
    CONSTRAINT [PK_Requirment_of_the_company] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [Facilities] (
    [Id] INT NOT NULL,
    [Name] VARCHAR(1000) NOT NULL,
    CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED ([Id] ASC)
)
CREATE TABLE [Requirment_bridge] (
    [job_opportunity_id] INT NOT NULL,
    [Requirment_of_the_company_id] INT NOT NULL,
    CONSTRAINT [FK_Requirment_bridge_job_opportunity_id] FOREIGN KEY([job_opportunity_id])
    REFERENCES [job_opportunity] ([Id])
)

CREATE TABLE [Facilities_of_the_job] (
    [job_opportunity_id] INT NOT NULL,
    [Facility_id] INT NOT NULL,
    CONSTRAINT [FK_Facilities_of_the_job_job_opportunity_id] FOREIGN KEY([job_opportunity_id])
    REFERENCES [job_opportunity] ([Id])
)

ALTER TABLE [job_opportunity] WITH CHECK ADD CONSTRAINT [FK_job_opportunity_Company_id] FOREIGN KEY([Company_id])
REFERENCES [Company] ([Id])

ALTER TABLE [job_opportunity] CHECK CONSTRAINT [FK_job_opportunity_Company_id]

ALTER TABLE [job_opportunity] WITH CHECK ADD CONSTRAINT [FK_job_opportunity_Location_id] FOREIGN KEY([Location_id])
REFERENCES [Location] ([Id])

ALTER TABLE [job_opportunity] CHECK CONSTRAINT [FK_job_opportunity_Location_id]

ALTER TABLE [job_opportunity] WITH CHECK ADD CONSTRAINT [FK_job_opportunity_Country_id] FOREIGN KEY([Country_id])
REFERENCES [Country] ([id])

ALTER TABLE [job_opportunity] CHECK CONSTRAINT [FK_job_opportunity_Country_id]

ALTER TABLE [Requirment_bridge] WITH CHECK ADD CONSTRAINT [FK_Requirment_bridge_Requirment_of_the_company_id] FOREIGN KEY([Requirment_of_the_company_id])
REFERENCES [Requirment_of_the_company] ([Id])

ALTER TABLE [Requirment_bridge] CHECK CONSTRAINT [FK_Requirment_bridge_Requirment_of_the_company_id]

ALTER TABLE [Facilities_of_the_job] WITH CHECK ADD CONSTRAINT [FK_Facilities_of_the_job_Facility_id] FOREIGN KEY([Facility_id])
REFERENCES [Facilities] ([Id])

ALTER TABLE [Facilities_of_the_job] CHECK CONSTRAINT [FK_Facilities_of_the_job_Facility_id]
