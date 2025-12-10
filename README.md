Vladyka Markiyan 4CS-31

```
./run.sh                                         запуск інстансу
ssh -i my-key.pem ubuntu@                        зайти в інстанс
id adminuser                                     перевірити користувача adminuser
id poweruser                                     перевірити користувача poweruser
sudo cat /root/adminuser_password.txt            перевірити пароль для adminuser
su - adminuser або ssh adminuser ubuntu@         увійти в adminuser
su - poweruser                                   увійти в poweruser
ls -l /home/adminuser                            перевірити доступ poweruser до adminuser
```