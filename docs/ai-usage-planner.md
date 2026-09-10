# AI Usage Planner

## Architecture

The planner is a client-only tool. Its versioned document is stored in `localStorage` under `coldfusionexpert.aiUsagePlanner.v1` and can be exported or imported as JSON. No account, server, API request, or database is used.

Usage is modeled as an array of AI records. Each record has an unlimited array of independent limits; a limit stores its window length, editable next reset, and manually entered percentage used. No provider allowance or total quota is required: percentages are the source value, matching provider dashboards.

The Compare screen ranks every configured AI by its most restrictive window and shows the comparable percentage pace and reset data.

The JavaScript layer separates providers from the UI with a small provider boundary:

- `UsageProvider` is the abstract contract for reading a limit's current usage.
- `ManualUsageProvider` returns the value entered by the user.
- A future API provider can implement the same `getUsage(ai, limit)` method without changing calculations or screens.

Provider suggestions shown in the form are initial UI data only. Calculations never branch on provider names.

## Calculation decisions

- Remaining percentage is clamped between 0% and 100%.
- Safe hourly pace is remaining percentage divided by hours to reset; safe daily pace is the hourly pace multiplied by 24.
- Expected usage is elapsed-window percentage.
- The traffic light compares actual usage with expected usage: green is within 5 percentage points over plan, amber within 15 points, and red beyond that or above 100%.
- An AI inherits the most restrictive limit: the lowest remaining percentage, with red taking precedence on ties.
- Expired windows roll forward by their own duration and reset manual usage to zero, so stale limits cannot distort a new period.

All dates are stored as ISO timestamps. The UI uses the browser's local timezone for editing and display.
