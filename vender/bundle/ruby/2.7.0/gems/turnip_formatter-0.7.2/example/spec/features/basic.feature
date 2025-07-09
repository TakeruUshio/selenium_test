Feature: Battle a monster

  Scenario: normal monster
    Given there is a monster
     When I attack it
     Then it should die
      And Fanfare

  Scenario: [ERROR] strong monster

    This scenario will not success because his attacks can't defeat strong monster

    Given there is a strong monster
     When I attack it
     Then it should die
      And Fanfare

  @aggregate_failures
  Scenario: [ERROR] boss monster (aggregate_failures)

    Even if error occurs during steps, test will run to the end

    Given there is a boss monster
     When I attack it
     Then it should die
     When I attack it
     Then it should die
     When I attack it
     Then it should die
      And Fanfare

  Scenario: [PENDING] spell magic

    This scenario will not success because he can't cast spell

    Given there is a strong monster
     When I cast a spell 'fireball'
      And I attack it
     Then it should die
      And Fanfare

  @magician
  Scenario: spell magic

    `magician` can cast spell.

    Given there is a strong monster
     When I cast a spell 'fireball'
      And I attack it
     Then it should die
      And Fanfare
