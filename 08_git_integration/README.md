
---

# Git Integration

---

# Before Integration

### Lets talk about Plugins

Plugins are the primary means of enhancing the functionality of a Jenkins environment to suit organization- or user-specific needs. There are over a thousand different plugins which can be installed on a Jenkins controller and to integrate various build tools, cloud providers, analysis tools, and much more.


---

# Installing a plugin

Jenkins provides two methods for installing plugins on the controller:

- Using the "Plugin Manager" in the web UI.
- Using the Jenkins CLI install-plugin command.

---

# Installing a plugin

### From the web UI

The simplest and most common way of installing plugins is through the `Manage Jenkins` -> `Manage Plugins` view, available to administrators of a Jenkins environment.

<img src="../99_misc/.img/plugin-manager.png" alt="plugin-manager" style="float:right;width:400px;">

Under the Available tab, plugins available for download from the configured Update Center can be searched and considered:
Available tab in the Plugin Manager

---

# Installing a plugin

### Using the Jenkins CLI

Administrators may also use the Jenkins CLI which provides a command to install plugins. Scripts to manage Jenkins environments, or configuration management code, may need to install plugins without direct user interaction in the web UI.

```sh
Jenkins CLI allows a command line user or automation tool to download a plugin and its dependencies.

java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin SOURCE ... [-deploy] [-name VAL] [-restart]

Installs a plugin either from a file, an URL, or from update center.

 SOURCE    : If this points to a local file, that file will be installed. If
             this is an URL, Jenkins downloads the URL and installs that as a
             plugin.Otherwise the name is assumed to be the short name of the
             plugin in the existing update center (like "findbugs"),and the
             plugin will be installed from the update center.
 -deploy   : Deploy plugins right away without postponing them until the reboot.
 -name VAL : If specified, the plugin will be installed as this short name
             (whereas normally the name is inferred from the source name
             automatically).
 -restart  : Restart Jenkins upon successful installation.

```

---

# Practice 

### Let's add some plugin

- Please install next list of plugins via UI :
      - gitlab
      - gitlab-api
      - gitlab-logo

- Please install net list of plugins via shell:
      - docker
      - ansible
      - ec2

---

# Integration with Git


Building our code with UI seem fun and all, yet it is not fully automated and here is where Git Integration comes in to picture.

Let's connect our jenkins pipeline and gitlab account with web-hook, that will notify each other about changes and trigger the build without us meddling with UI or build buttons.

If you have not installed gitlab plugins from previous chapter, please install it now.

Once installed, create new pipeline, or choose existing pipeline and open its configuration:

- On your Jenkins instance:
    - Choose pipeline
    - Go to your pipelines `Build Triggers` section
        - Seek for `Build when a change is pushed to GitLab. GitLab webhook URL: http://YOUR-PUBLIC-IP-ADDRESS/project/`
        - In that section seek for `Advance`
            - Search `Secret Token` tab  and `Generate` button that will create secret token for our connection


- On Gitlab account:
    - Go to projects `Settings -> Webhooks`
        - In url insert the ip address of our instance
        - Insert `Secret Token` created in Jenkins build triggers
        - Check the Push events,Comments, Issues events and push the `Add webhook` button
            - The last button will create new project hook, which you need to test whether it works or not

---
# Practice

---

# Automation with webhook

- Create a webhook on gitlab to run build on your project 

---

# Summary practice
