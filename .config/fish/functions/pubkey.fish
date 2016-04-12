function pubkey -d "Copies public key into clipboard"
         cat ~/.ssh/id_rsa.pub | pbcopy | echo "Public key has been copied to clipboard."
end
