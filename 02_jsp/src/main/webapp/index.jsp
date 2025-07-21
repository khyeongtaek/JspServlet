<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP 파일 트리</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .tree {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .folder {
            font-weight: 500;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 0;
        }
        .file {
            margin-left: 28px;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 4px 0;
        }
        .material-icons {
            font-size: 20px;
        }
        .folder .material-icons {
            color: #ffd700;
        }
        .file .material-icons {
            color: #90caf9;
        }
        ul {
            list-style-type: none;
        }
        a {
            text-decoration: none;
            color: #37474f;
            transition: color 0.2s;
        }
        a:hover {
            color: #1976d2;
        }
        h2 {
            margin-bottom: 20px;
            color: #1976d2;
        }
    </style>
</head>
<body>
<h2>JSP 파일 트리</h2>

<%!
    private void findJspFiles(File dir, String path, TreeMap<String, List<String>> fileTree) {
        File[] fileList = dir.listFiles();
        if (fileList != null) {
            for (File file : fileList) {
                if (file.isDirectory()) {
                    findJspFiles(file, path + "/" + file.getName(), fileTree);
                } else if (file.getName().endsWith(".jsp")) {
                    // root 경로의 index.jsp는 제외
                    if (path.isEmpty() && file.getName().equals("index.jsp")) {
                        continue;
                    }
                    String folder = path.isEmpty() ? "root" : path;
                    fileTree.computeIfAbsent(folder, k -> new ArrayList<>()).add(file.getName());
                }
            }
        }
    }
%>

<%
    String rootPath = request.getContextPath();
    File webappDir = new File(application.getRealPath("/"));
    TreeMap<String, List<String>> fileTree = new TreeMap<>();
    findJspFiles(webappDir, "", fileTree);
    
    // root 폴더에 파일이 없다면 해당 항목 제거
    if (fileTree.containsKey("root") && fileTree.get("root").isEmpty()) {
        fileTree.remove("root");
    }
%>

<div class="tree">
    <ul>
        <% for (Map.Entry<String, List<String>> entry : fileTree.entrySet()) { %>
            <li>
                <div class="folder">
                    <span class="material-icons">folder</span>
                    <%= entry.getKey().equals("root") ? "/" : entry.getKey() %>
                </div>
                <ul>
                    <% for (String file : entry.getValue()) { 
                        String fullPath = entry.getKey().equals("root") ? 
                            file : entry.getKey() + "/" + file;
                        if (fullPath.startsWith("/")) {
                            fullPath = fullPath.substring(1);
                        }
                    %>
                        <li class="file">
                            <span class="material-icons">description</span>
                            <a href="<%= rootPath %>/<%= fullPath %>" target="_blank"><%= file %></a>
                        </li>
                    <% } %>
                </ul>
            </li>
        <% } %>
    </ul>
</div>

</body>
</html>