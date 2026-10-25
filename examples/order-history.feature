# language: en
# A restaurant ordering flow. Steps find things the way a user does (role, visible text),
# so this file survives a rewrite of the user interface on another framework.
Feature: Order history

  Background:
    Given a restaurant "demo" with a product "Pizza" at 9990 and delivery at 2990

  Scenario: A diner sees only their own orders
    When a guest orders 1 "Pizza" as "ana@test.com"
    And "ana@test.com" opens their order history
    Then they see 1 order with total 12980
    And they do not see orders from "luis@test.com"

  Scenario: An order from another restaurant is not listed
    Given a restaurant "other" where "ana@test.com" has 1 order
    When "ana@test.com" opens their order history at "demo"
    Then they see no orders
