# postmortem report

## issue

server problems due to incorrect nginx user setup.

## background

on unix systems, the root user has all the power and can do anything on the machine. this makes root a big target for hackers. to keep things secure, it’s a good idea to avoid running important services like web servers as root. instead, these services should run under a less privileged user, like nginx, to limit what an attacker can do if they break in.

## what happened

we needed to set up a container so that nginx would run as the nginx user instead of root. i tried to solve this by editing the nginx configuration file and restarting the service with a command that switched users. specifically, i used the `su` command to restart nginx as the nginx user, but this didn’t work as expected.

## the problems

- **service failure:** the way i tried to switch nginx from root to the nginx user didn’t work well in the container environment. as a result, nginx either didn’t start at all or continued running as root, which completely missed the point.
  
- **security risks:** since nginx didn’t end up running as the nginx user, the server was still vulnerable. if a hacker had found a way in, they could have potentially gained root access, which would be really bad.

- **server disruption:** the script also had a command to kill apache, assuming that nginx would immediately start running. but since nginx didn’t start properly, this left the server without any web service, causing downtime.

## what i did to fix it

once i noticed the problem, i reverted the server back to its previous state to get it running again. then, i rewrote the script. instead of using `su` to switch users, i directly edited the nginx configuration to make sure it always runs as the nginx user. this approach was simpler and more effective.

i also made sure to test these changes in a safe environment before applying them to the live server. finally, i did a security check to confirm that everything was secure.

## what i learned

this experience taught me that while securing services by running them as non-root users is important, it’s just as important to test configurations thoroughly before deploying them. keeping things simple is often the best approach because it reduces the chances of mistakes.

## next steps

i’ve updated my script to use the new, simpler method and added extra testing steps to avoid this kind of issue in the future. i’ll also continue to check our server setups to ensure all services are running with the least amount of privilege necessary.

by learning from this, i’m better prepared to secure servers and prevent disruptions in the future.
