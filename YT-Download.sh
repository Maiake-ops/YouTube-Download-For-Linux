#!/bin/bash

DOWNLOAD_DIR="${HOME}/Downloads/YouTube Videos"
YTDLP_PATH="yt-dlp" # Or specify full path like "/usr/local/bin/yt-dlp"


if [ ! -d "${DOWNLOAD_DIR}" ]; then
    echo "Creating download directory: \"${DOWNLOAD_DIR}\""
    mkdir -p "${DOWNLOAD_DIR}"
fi

read -p "Enter the video URL: " VIDEO_URL


cd "${DOWNLOAD_DIR}" || { echo "Error: Could not change to directory ${DOWNLOAD_DIR}"; exit 1; }


echo ""
echo "Downloading video from: ${VIDEO_URL}"
echo "Saving to: ${DOWNLOAD_DIR}"
echo ""

"${YTDLP_PATH}" "${VIDEO_URL}"


if [ $? -ne 0 ]; then
    echo ""
    echo "An error occurred during download! Make sure yt-dlp is installed and the URL is valid."
else
    echo ""
    echo "Download complete!"
fi

echo ""
read -p "Press Enter to continue..."
