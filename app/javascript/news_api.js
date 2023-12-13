document.addEventListener('DOMContentLoaded', function() {
  const form = document.getElementById('newsForm');
  const queryInput = document.getElementById('query');
  const resultsContainer = document.getElementById('newsResults');

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    const query = queryInput.value;
    getNewsArticles(query);
  });

  function getNewsArticles(query) {
    $.ajax({
      url: '/api/get_news_articles',
      method: 'GET',
      data: { query: query },
      success: function(response) {
        displayArticles(response.articles);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.error('AJAX Error:', textStatus, errorThrown);
      }
    });
  }

  function displayArticles(articles) {
    resultsContainer.innerHTML = '';
  
    if (articles.length > 0) {
      const ul = document.createElement('ul');
  
      articles.forEach(function(article) {
        const li = document.createElement('li');
        const input = document.createElement('input');
        input.type = 'radio';
        input.name = 'articleSelection'; 
        input.value = article.url; 
  
        const label = document.createElement('label');
        label.textContent = article.title;
  
        li.appendChild(input);
        li.appendChild(label);
        ul.appendChild(li);
      });
  
      resultsContainer.appendChild(ul);
    } else {
      resultsContainer.innerHTML = '<p>No articles found.</p>';
    }
  }
  
});
