#!/bin/bash


PDF="/home/mortivarus/Desktop/Web Scraping with Python Data Extraction from the Modern Web.pdf"

folder="./output"

# mkdir -p $folder

touch summaries.txt

pdfseparate "$PDF" output/page-%04d.pdf

summarize_text(){
    model="llama3.2:3b"
    text=$1
    prompt="Write a concise summary of the following. Only return the summary. Do not return phrasing such as 'here is the summary', just return the summary: 
    
    $text
    "
    summary="$(ollama run $model "$prompt")"
    echo "$summary"
}


for i in $folder/*.pdf
do
    echo "Handling $(basename $i)"
    pdftotext $i
    rm $i
done





# for i in $folder/*.txt
# do
#     summarize_page "$i" >> summaries.txt
# done

# summarize_book(){
#     model="llama3.2:3b"
#     summaries_file=$1
#     context="$(cat $summaries_file)"
#     prompt="The following is a set of summaries:
#     $context
#     Take these and distill it into a final, consolidated summary
#     of the main themes.
#     "
#     summary="$(ollama run $model $prompt)"
#     echo "$summary"
# }

# summarize_book "summaries.txt"