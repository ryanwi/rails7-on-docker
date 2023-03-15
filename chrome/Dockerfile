FROM ubuntu:18.04

LABEL Full Name <email@email.com> https://yourwebsite.com

WORKDIR /home/

COPY wrapper-script.sh wrapper-script.sh

# install chromium-browser and cleanup.
RUN apt update && apt install chromium-browser --no-install-recommends -y && apt autoremove && apt clean && apt autoclean && rm -rf /var/lib/apt/lists/*

# Run your commands and add environment variables from your compose file.
CMD ["sh", "wrapper-script.sh"]