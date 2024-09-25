# Mini Project Overview

This mini project has been developed incrementally, level by level, from Level 1 to Level 5. Each level introduces new features and complexities, building upon the previous level's implementation.

## Levels

1. **Level 1**: Basic implementation of the rental calculation logic.
2. **Level 2**: Added commission fees for insurance, assistance, and the platform.
3. **Level 3**: Introduced the concept of deductible reduction.
4. **Level 4**: Implemented payment actions for different stakeholders.
5. **Level 5**: Added additional features that drivers can purchase, such as GPS, baby seat, and additional insurance.

## Commit Structure

Each commit at each level includes a `result.json` file, which contains the expected output for that level. This allows for easy comparison of results and ensures that the implementation meets the requirements at each stage.

## Final Commit

The final commit includes a comprehensive refactoring of the codebase. This refactoring introduces templating patterns and organizes the code into directories for better maintainability and readability.

## Remarks

1. I've decided to use a repository pattern to "fake" a DB.
2. I've coupled the fetch of data, options and car, in the `Rental` class. This is not a good practice (aka ActiveRecord coupled with models in Rails) but I've decided to keep it 
   simple and it would be overkill for the test to use a query service pattern.
3. We could move also builders into the services directory as the builder pattern does not really exist. 