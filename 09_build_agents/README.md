
---

# Distributed Builds

---

# Distributed Builds

## How does this work?

A Jenkins "master" operating by itself is the basic installation of Jenkins and in this configuration the master handles all tasks for your build system. In most cases installing an agent doesn't change the behavior of the master. It will serve all HTTP requests, and it can still build projects on its own. Once you install a few agents you might find yourself removing the executors on the master in order to free up master resources (allowing it to concentrate resources on managing your build environment) but this is not a necessary step, but usually a security measure. 

An agent is a computer that is set up to offload build projects from the master and once setup this distribution of tasks is fairly automatic. The exact delegation behavior depends on the configuration of each project; some projects may choose to "stick" to a particular machine for a build, while others may choose to roam freely between agents. 

---

# Distributed Builds (cont.)

## How does this work? (cont.)
Since each agent runs a separate program called an "agent" there is no need to install the full Jenkins (package or compiled binaries) on an agent. There are various ways to start agents, but in the end the agent and Jenkins master need to establish a bi-directional communication link (for example a TCP/IP socket) in order to operate.

---

## Master to agent connections

The most popular ways agents are configured are via connections that are initiated from the master. This allows agents to be minimally configured and the control lives with the master. This does require that the master have network access to the agent usually via ssh. 

---

## Choosing which agent pipelines and steps run on

As you will see below, agents can be labelled. This means different part of your build, or pipeline, can be allocated to run in specific agents (based on their label). This can be useful for tools, operating systems or perhaps for security purposes (it is possible to set quite detailed access rules of what can run where, based on agent configurations). A server that runs an agent is often referred to as a "Node" in Jenkins terminology. 
Different ways of starting agents

---
# Build with SSH Agent
 
### parallel builds

---

# Build with Docker


---

# Build with Docker

### parallel builds

