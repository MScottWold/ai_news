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

export const getFrontPage = () => {
  return fetch("api/articles/front_page");
};

export const getArticle = id => {
  return fetch(`/api/articles/${id}`);
};

export const getAuthor = (id) => {
  return fetch(`/api/authors/${id}`);
};

export const getAuthorArticles = (authorId, filter = {}) => {
  return fetch(`/api/authors/${authorId}/articles${parameterizeQuery(filter)}`);
};

export const postSession = (user) => {
  return fetch(
    "/api/session",
    {
      headers,
      method: "POST",
      body: JSON.stringify(user),
    },
  )
};

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

export const favoriteRequest = async (articleId, favorite) => {
  const response = await fetch(
    `api/articles/${articleId}/favorites`,
    {
      headers,
      method: favorite ? "POST" : "DELETE",
    },
  );

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
