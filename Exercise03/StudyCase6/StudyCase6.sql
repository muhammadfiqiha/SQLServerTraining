------- Study Case 6 Sales Promotion ---------
-- Create database
CREATE DATABASE SalesPromotion;
USE SalesPromotion;

-- Create table
-- Requirements & relationship
-- 1. Each campaign targets a list of car models and has start/end date, discount amount, and marketing region
-- 2. Dealers can participate in multiple campaigns
-- 3. Customers who buy eligible cars during the promotion period receive benefits

-- PromotionCampaign
CREATE TABLE PromotionCampaign (
	CampaignId INT PRIMARY KEY IDENTITY(1,1),
	StartDate DATE,
	EndDate DATE,
	DiscountPercent FLOAT,
	MarketingRegion VARCHAR(20),
	BenefitId INT NOT NULL,

	FOREIGN KEY (BenefitId) REFERENCES CustBenefit(BenefitId),
);

-- CarModel
CREATE TABLE CarModel (
	ModelId INT PRIMARY KEY IDENTITY(1,1),
	ModelName VARCHAR(20),
	FuelType VARCHAR(10),
);

-- Dealer 
CREATE TABLE Dealer (
	DealerId INT PRIMARY KEY IDENTITY(1,1),
	DealerName VARCHAR(20),
);

-- Customer Benefit
CREATE TABLE CustBenefit (
	BenefitId INT PRIMARY KEY IDENTITY(1,1),
	BenefitDesc TEXT NOT NULL,
);

-- Dealer Model PromotionCampaign
CREATE TABLE CampaignList (
	CampaignListId INT PRIMARY KEY IDENTITY(1,1),
	CampaignId INT NOT NULL,
	ModelId INT NOT NULL,
	DealerId INT NOT NULL,

	FOREIGN KEY (CampaignId) REFERENCES PromotionCampaign(CampaignId),
	FOREIGN KEY (ModelId) REFERENCES CarModel(ModelId),
	FOREIGN KEY (CampaignId) REFERENCES Dealer(DealerId),
);