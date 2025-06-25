const parameterizeQuery = (params) => {
  if (Object.keys(params).length === 0) {
    return "";
  } else {
    const queryParams = new URLSearchParams();
    Object.entries(params).
      forEach(([key, value]) => queryParams.append(key, value));

    return `?${queryParams.toString()}`;
  }
};

const headers = {
  "Content-Type": "application/json",
  "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
};

export const getArticles = (params) => (
  fetch(`/api/articles${parameterizeQuery(params)}`)
);

export const getFrontPage = () => fetch("api/articles/front_page");

export const getArticle = (id) => fetch(`/api/articles/${id}`);

export const getAuthor = (id) => fetch(`/api/authors/${id}`);

export const getAuthorArticles = (authorId, filter = {}) => (
  fetch(`/api/authors/${authorId}/articles${parameterizeQuery(filter)}`)
);

export const postSession = (user) => (
  fetch(
    "/api/session",
    {
      headers,
      method: "POST",
      body: JSON.stringify(user),
    },
  )
)

export const deleteSession = () => (
  fetch(
    "/api/session",
    {
      headers,
      method: "DELETE",
    },
  )
);

export const postUser = user => (
  fetch(
    "/api/users",
    {
      headers,
      method: "POST",
      body: JSON.stringify(user),
    },
  )
);

export const favoriteRequest = async (articleId, favoriteId) => {
  const method = !!favoriteId ? "DELETE" : "POST";

  let path;
  if (!!favoriteId) {
    path = `api/favorites/${favoriteId}`;
  } else {
    path = `api/articles/${articleId}/favorites`;
  }

  const response = await fetch(path, { headers, method });

  if (response.ok) {
    return await response.json();
  } else {
    return null;
  }
};

export const postComment = async (articleId, body) => {
  const response = await fetch(
    `/api/articles/${articleId}/comments`,
    {
      headers,
      method: "POST",
      body: JSON.stringify({ body }),
    },
  )

  return response.json();
};

export const getComments = async (articleId, filter = {}) => {
  const response = await fetch(
    `/api/articles/${articleId}/comments${parameterizeQuery(filter)}`,
  );

  if (response.ok) {
    return await response.json();
  } else {
    return [];
  }
};
