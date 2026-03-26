//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  // llama-server

$inputs:=[\
"In bocca al lupo per il tuo esame!"; \
"Ti auguro tanto successo per la prova."\
]

$batch:=$AIClient.embeddings.create($inputs)

$it1:=$batch.embeddings[0].embedding
$it2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$it1.cosineSimilarity($it2)
//0.897655893356