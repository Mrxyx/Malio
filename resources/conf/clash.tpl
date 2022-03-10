#---------------------------------------------------#
## 更新：{date("Y-m-d h:i:s")}
## 感谢：https://github.com/Hackl0us/SS-Rule-Snippet
## 链接：{$userapiUrl}
#---------------------------------------------------#

# HTTP 代理端口
port: {if array_key_exists("port",$opts)}{$opts['port']}{else}7890{/if} 

# SOCKS5 代理端口
socks-port: {if array_key_exists("socks-port",$opts)}{$opts['socks-port']}{else}7891{/if} 

# Linux 和 macOS 的 redir 代理端口
redir-port: {if array_key_exists("redir-port",$opts)}{$opts['redir-port']}{else}7892{/if} 

# 允许局域网的连接
allow-lan: true

# 规则模式：Rule（规则） / Global（全局代理）/ Direct（全局直连）
mode: Rule

# 设置日志输出级别 (默认级别：silent，即不输出任何内容，以避免因日志内容过大而导致程序内存溢出）。
# 5 个级别：silent / info / warning / error / debug。级别越高日志输出量越大，越倾向于调试，若需要请自行开启。
log-level: {if array_key_exists("log-level",$opts)}{$opts['log-level']}{else}silent{/if}

# Clash 的 RESTful API
external-controller: '0.0.0.0:9090'

# RESTful API 的口令
secret: '{if array_key_exists("secret",$opts)}{$opts['secret']}{else}{/if}' 

# 您可以将静态网页资源（如 clash-dashboard）放置在一个目录中，clash 将会服务于 `RESTful API/ui`
# 参数应填写配置目录的相对路径或绝对路径。
# external-ui: folder



dns:
  enable: false
  ipv6: false
  listen: 0.0.0.0:53
  enhanced-mode: fake-ip
  nameserver:
    - 114.114.114.114
  fallback:
    - tls://dns.rubyfish.cn:853


{$confStr['Proxy']}:
{foreach $Proxys as $Proxy}
  - {json_encode($Proxy,320)}
{/foreach}

{$confStr['ProxyGroup']}:
{$ProxyGroups}

# 规则
{$confStr['Rule']}:
{if $Profiles == 'ConnersHua_Pro'}
{include file='rule/ConnersHua_Pro.yaml'}
{elseif $Profiles == 'ConnersHua_BacktoCN'}
{include file='rule/ConnersHua_BacktoCN.yaml'}
{else}
{include file='rule/lhie1_Rule.yaml'}
{/if}
