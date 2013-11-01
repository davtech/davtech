<%
sch = "http://schemas.microsoft.com/cdo/configuration/"
Set cdoConfig = Server.CreateObject("CDO.Configuration")


'Variaveis
Dim meuservidorsmtp
Dim minhacontaautenticada
Dim minhasenhaparaenvio
Dim emailorigem
Dim emaildestino

'Abaixo seguem algumas definicoes de variaveis para o envio de seu formulario. Por favor preencha os campos abaixo.

meuservidorsmtp = "smtp.davtech.com.br" ' Informacoes so seu servidor SMTP
minhacontaautenticada = "formenvia@davtech.com.br" ' conta de e-mail utilizada para enviar
minhasenhaparaenvio = "Master01" ' senha da conta de e-mail
emailorigem = "formenvia@davtech.com.br" ' e-mail que indica de onde partiu a mensagem
emaildestino = "davtech@davtech.com.br" ' e-mail que vai receber as mensagens do formulario

'Fim da definição manual de parâmetros.

cdoConfig.Fields.Item(sch & "sendusing") = 2
cdoConfig.Fields.Item(sch & "smtpauthenticate") = 1
cdoConfig.Fields.Item(sch & "smtpserver") = meuservidorsmtp
cdoConfig.Fields.Item(sch & "smtpserverport") = 25
cdoConfig.Fields.Item(sch & "smtpconnectiontimeout") = 30
cdoConfig.Fields.Item(sch & "sendusername") = minhacontaautenticada
cdoConfig.Fields.Item(sch & "sendpassword") = minhasenhaparaenvio
cdoConfig.fields.update
Set cdoMessage = Server.CreateObject("CDO.Message")
Set cdoMessage.Configuration = cdoConfig

cdoMessage.BodyPart.Charset = "iso-8859-1"
cdoMessage.From = emailorigem
cdoMessage.To = emaildestino
cdoMessage.Subject = "Formulario de Contato"
cdoMessage.ReplyTo = Request("emailrem")

strBody = "Dados <br> <br>" & _
"Nome:"& Request("nome")& "<br>" & _
"E-Mail:"& Request("email")& "<br>" & _
"Telefone:"& Request("telefone")& "<br>" & _
"Assunto:"& Request("assunto")& "<br>" & _
"Mensagem:"& Request("recado")

strBody = strBody & "."
cdoMessage.HTMLBody = strBody

cdoMessage.Send

Set cdoMessage = Nothing
Set cdoConfig = Nothing

Response.redirect "contatoresp.html"
%>