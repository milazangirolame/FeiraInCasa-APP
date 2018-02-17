<script>
let parameters = {};
let graphQLEndpoint = "queries";
function graphQLFetcher(graphQLParams) {
      return fetch(graphQLEndpoint, {method: 'post',
      headers: { "Content-Type": "application json",
        "X-CSRF-Token": "uCaF2zxA3nBGBekNBkBktqsA09L+N68aCSvuZrvxpVVdcFzJ4UMb6JVER2dV5ZIu2jK7cLJQ4x2s28Eb1mOV4Q=="},
      body: JSON.stringify(graphQLParams),
      credentials: 'include',}).then(function (response)
      {console.log(response)});
      }
    </script>
