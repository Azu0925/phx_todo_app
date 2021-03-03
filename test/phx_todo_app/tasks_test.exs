defmodule PhxTodoApp.TasksTest do
  use PhxTodoApp.DataCase

  alias PhxTodoApp.Tasks

  describe "cards" do
    alias PhxTodoApp.Tasks.Card

    @valid_attrs %{done: true, name: "some name"}
    @update_attrs %{done: false, name: "some updated name"}
    @invalid_attrs %{done: nil, name: nil}

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Tasks.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Tasks.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Tasks.create_card(@valid_attrs)
      assert card.done == true
      assert card.name == "some name"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, %Card{} = card} = Tasks.update_card(card, @update_attrs)
      assert card.done == false
      assert card.name == "some updated name"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_card(card, @invalid_attrs)
      assert card == Tasks.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Tasks.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Tasks.change_card(card)
    end
  end
end
