version: '2'
        ghost:
          image: ghost:latest
          container_name: ghost-blog
          environment:
            - NODE_ENV=production
            - MYSQL_DATABASE={{db-name}} # Change {{db-name}}
            - MYSQL_USER={{username}} # Change {{username}}
            - "MYSQL_PASSWORD={{db-password}}" # Change {{db-password}}
            - "MAILGUN_USER={{mailgun-user}}" # Change {{mailgun-user}}
            - "MAILGUN_PASSWORD={{mailgun-password}}" # Change {{mailgun-password}}
          volumes:
            - ./ghost:/var/lib/ghost
          ports:
            - 2368:2368
          depends_on:
            - mysql
          restart: always

        mysql:
          image: mysql:latest
          container_name: ghost-db
          environment:
            - MYSQL_DATABASE={{db-name}} # Change {{db-name}}
            - MYSQL_ROOT_PASSWORD={{root-password}} # Change {{root-password}}
            - MYSQL_USER={{username}} # Change {{username}}
            - MYSQL_PASSWORD={{db-password}} # Change {{db-password}}
          volumes:
            - ./db:/var/lib/mysql
          restart: always
