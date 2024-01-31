
# Expense Tracker Using Flutter with SMS Parsing
## Overview
This repository showcases the development of an autonomous expense tracker using Flutter. The app automates the process of tracking expenses by extracting financial data from SMS messages. The primary objectives include:

Reading and sorting messages related to expenses.
Extracting transaction data such as amount and date from sorted messages.
Categorizing transactions based on the mode of payment.
Visualizing the obtained data through graphs and charts for user-friendly analysis.
Implementation Methodology
App Workflow

Note: The current implementation relies on regular expressions, making it user-specific. A more robust approach involves using machine learning for parsing and categorizing financial SMS messages. This repository serves as a conceptual demonstration.

## Implementation Steps
SMS Collection: Utilizing the Telephony package to gather all SMS messages received by the user.

Expense Message Separation: Identifying and segregating expense-related messages through regular expressions.

Parsing Information: Extracting essential details like date and amount spent from SMS messages using Flutter functionalities.

User Modification: Implementing features that allow users to modify and categorize their expenses manually.

User Interface Rendering: Creating a user interface using Flutter to present processed information, including graphs and charts.

## Result
The application successfully creates a highly accurate expense tracker by parsing SMS data with the help of Flutter libraries (e.g., Telephony) and regular expressions. The core functionality of the app has been demonstrated, providing users with an efficient tool for expense management.

## Future Enhancements
Machine Learning Integration: Implement machine learning methods for parsing and categorizing SMS messages, making the app adaptable to different users.

Cloud Sync: Enable synchronization with cloud services to ensure data backup and access from multiple devices.

Expense Insights: Incorporate additional features such as expense trends, budget tracking, and personalized insights.

Security Measures: Implement secure methods for handling financial data and ensure user privacy.
