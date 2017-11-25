defmodule Rumbl.MediasTest do
  use Rumbl.DataCase

  alias Rumbl.Medias

  describe "videos" do
    alias Rumbl.Medias.Video

    @valid_attrs %{description: "some description", title: "some title", url: "some url"}
    @update_attrs %{description: "some updated description", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, title: nil, url: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medias.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Medias.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Medias.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Medias.create_video(@valid_attrs)
      assert video.description == "some description"
      assert video.title == "some title"
      assert video.url == "some url"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medias.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, video} = Medias.update_video(video, @update_attrs)
      assert %Video{} = video
      assert video.description == "some updated description"
      assert video.title == "some updated title"
      assert video.url == "some updated url"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Medias.update_video(video, @invalid_attrs)
      assert video == Medias.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Medias.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Medias.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Medias.change_video(video)
    end
  end

  describe "categories" do
    alias Rumbl.Medias.Category

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medias.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Medias.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Medias.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Medias.create_category(@valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medias.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Medias.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Medias.update_category(category, @invalid_attrs)
      assert category == Medias.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Medias.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Medias.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Medias.change_category(category)
    end
  end

  describe "annotations" do
    alias Rumbl.Medias.Annotation

    @valid_attrs %{at: 42, body: "some body"}
    @update_attrs %{at: 43, body: "some updated body"}
    @invalid_attrs %{at: nil, body: nil}

    def annotation_fixture(attrs \\ %{}) do
      {:ok, annotation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Medias.create_annotation()

      annotation
    end

    test "list_annotations/0 returns all annotations" do
      annotation = annotation_fixture()
      assert Medias.list_annotations() == [annotation]
    end

    test "get_annotation!/1 returns the annotation with given id" do
      annotation = annotation_fixture()
      assert Medias.get_annotation!(annotation.id) == annotation
    end

    test "create_annotation/1 with valid data creates a annotation" do
      assert {:ok, %Annotation{} = annotation} = Medias.create_annotation(@valid_attrs)
      assert annotation.at == 42
      assert annotation.body == "some body"
    end

    test "create_annotation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medias.create_annotation(@invalid_attrs)
    end

    test "update_annotation/2 with valid data updates the annotation" do
      annotation = annotation_fixture()
      assert {:ok, annotation} = Medias.update_annotation(annotation, @update_attrs)
      assert %Annotation{} = annotation
      assert annotation.at == 43
      assert annotation.body == "some updated body"
    end

    test "update_annotation/2 with invalid data returns error changeset" do
      annotation = annotation_fixture()
      assert {:error, %Ecto.Changeset{}} = Medias.update_annotation(annotation, @invalid_attrs)
      assert annotation == Medias.get_annotation!(annotation.id)
    end

    test "delete_annotation/1 deletes the annotation" do
      annotation = annotation_fixture()
      assert {:ok, %Annotation{}} = Medias.delete_annotation(annotation)
      assert_raise Ecto.NoResultsError, fn -> Medias.get_annotation!(annotation.id) end
    end

    test "change_annotation/1 returns a annotation changeset" do
      annotation = annotation_fixture()
      assert %Ecto.Changeset{} = Medias.change_annotation(annotation)
    end
  end
end
