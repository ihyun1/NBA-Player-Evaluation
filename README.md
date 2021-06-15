# NBA-Player-Evaluation

## **Overview** 

In this project, we will build a supervised machine learning to analyze a dataset of NBA players from 2003 to 2020 in order to predict whether players will be successful in the NBA. We intend to construct this model with two levels, our first level will seek to predict success based on the minutes played per game, and if players are determined to be successful, then it will test for if the players have the potential to be elite based on their win share percentage. 

Our group was particularly interested in the NBA, and during the brainstorming process, we honed in on the topic of player evaluation and the importance that it holds in the league. Thus, we were interested in what could be seen as determining factors for a player's success and how teams might evaluate players during the draft process. The dataset for this project currently holds every NBA player's individual season statistics from 2003-04 season to the 2019-20 season. In addition to this, we have collected their alma mater, college statistics, and physical measurements. At the moment, our primary dataset has over 8,000 rows and 35 columns.

**Key Questions**
- What makes a player successful in the NBA?
- How can a potential draft bust be identified?
- Does the college that each player went to serve as an indicator of success?
- What are the differentiating factors between successful, league average players, and elite level players?

## **Project Management and Communication Protocols**

Our team is primarily communicating through Slack, as well as weekly zoom meetings. We created a Google Sheet file that transparently lays out the weekly tasks for the project to ensure that we are completing everything in a timely and efficient manner, and equally splitting the duties between the group. 

![Project_Management_Tool](Images/Project_Management_Tool.png)

![Presentation_requirements](Images/Presentation_requirements.png)

## **Database**

For the database, we constructed an ERD with the primary tables that we will be using, there are other tables created in our schema that we have decided to not use. 

![NBA_ERD](Images/NBA_ERD.png)

We wrote the queries to create the 4 tables and imported the data into each table. 

Then, we joined the nba_players and nba_college_stats tables to create a new table with all the NBA stats and college stats for NBA players from 2003-2019, who played in college.

Lastly, we loaded in the newly joined table into a jupyter notebook file, where we will use it to further develop our machine learning model.

![Connect_database](Images/Connect_database.png)

## **Machine Learning Process**

**1) Preliminary data preprocessing**

- Create an output column *MPPG_Status*. *Successful* players are those who play 24 minutes or more per game according to the *MPPG* column.  *Not Successful* players are those who play less than 24 minutes per game.

    ![Output_column](Images/Output_column.png)

- Drop irrelevant columns based on *Linear Regression* model (See Section 2 below).

    ![Drop_columns](Images/Drop_columns.png)

- Replace *dtypes* from strings to integers and replace *NaN* to *0*.
    - **Note:** We did not drop the *NaN* rows as dropping these rows would eliminate players that are significant to this model.  For example, players with 3P% with *NaN* are mostly all big men who typically would not take 3-pointers.  Instead of eliminating these players, we felt the more logical thing to do was to replace these with a *0*. 

    ![Dtypes_NA](Images/Dtypes_NA.png)

**2)  Preliminary feature engineering and preliminary feature selection**

- We ran a *linear regression* model in order to determine what features are relevant to include in our final machine learning model.

    ![Linear_Regression](Images/Linear_Regression.png)

- Results showed that the following columns are below the 0.05 P-value significance level hence we should remove these columns from our feature selection: 2P, 3P, 3PA, ORB, DRB, TRB, BLK, FG%, player_weight_kg, draft_number

**3) Data split into training and testing sets**

- Create our features and our target.

    ![Features_Target](Images/Features_Target.png)

- Split data into training and testing sets.

    ![Split_Data](Images/Split_Data.png)

**4) Explanation of model choice, including limitations and benefits**

- We chose the *Random Forest Model* as we wanted reduce overfitting and variance problems, hence improving accuracy.  Also, this model helps rank importance of the features as below.

    ![Rank_Importance](Images/Rank_Importance.png)

- A limitation with the *Random Forest Model* is that it complex and creates lot of trees requiring more computational power and resources. 

**5) Training our model**

- We used a couple methods to train our model. In addition to using the StandardScaler to train and test our data, one of the key ways we increased the accuracy of our model and trained it was using linear regression models on our features to determine which are the most related to our output, minutes played per game.

**6) Accuracy score**

- From our feature selection and training our model, we were able to achieve an accuracy score of 96.1% for our Random Forest Model shown below.

   ![Balanced_Accuracy_Score.png](Images/Balanced_Accuracy_Score.png)

Additionally, our model is well balanced between predicting both the unsuccessful and successful players, which is the core question of our project.

   ![Report.png](Images/Report.png)
   
**7) Elite Player Model**

- After training and running our model to predict successful players in the NBA. We wanted to take our model a step further and try to create another Random Forest Model in order to assess whether from the successful players, we can predict who the elite players will be. For this we selected our output to be the win share percentage, or ws, as we felt that the highest caliber of players in the league will have the greatest effect on if they win a given game. 

   ![elite_accuracy_score.png](Images/elite_accuracy_score.png)
    
As shown above, we were still able to achieve a high balanced accuracy score of .892.

   ![elite_report.png](Images/elite_report.png)

However, the report illustrates that our model was much better at being able to determine non-elite players as opposed to elite players.

   ![elite_counts.png](Images/elite_counts.png)

This makes sense logically as in general it is harder assess and predict whether or not a player will be an elite player in the league, but in addition, because there are just fewer elite players, 232, in comparison to successful but non-elite players the model doesn't have as much data to be trained with.

## **Presentation**

We have outlined the project in the Google Slides presentation: [NBA Success Predictor Presentation](https://docs.google.com/presentation/d/1W8KnGoBi8lcXjScGKJa9Jot-fBMlreqc4T3a1233-38/edit?usp=sharing).


