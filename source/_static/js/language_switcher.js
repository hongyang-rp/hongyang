document.addEventListener("DOMContentLoaded", function() {
    // Determine current language
    var currentPath = window.location.pathname;
    var isEnglish = currentPath.includes('/en/');
    var targetLang = isEnglish ? 'zh_CN' : 'en';
    var label = isEnglish ? '中文' : 'English';
    
    // Calculate new path
    var newPath = currentPath;
    if (isEnglish) {
        newPath = currentPath.replace('/en/', '/zh_CN/');
    } else {
        if (currentPath.includes('/zh_CN/')) {
            newPath = currentPath.replace('/zh_CN/', '/en/');
        } else {
            // Check if we are at the root or standard build path (e.g. local preview)
            // If path does not contain language code, we try to construct it.
            // Assumption: we are in the 'zh_CN' version by default if not 'en'.
            
            // If currentPath is "/" or "/index.html", we might be serving zh_CN root.
            // In that case, we need to go to ../en/index.html IF we are serving from build/html/zh_CN
            // BUT if we are serving from build/html/zh_CN, ../en/ is not accessible.
            
            // Best effort: Assume typical deployment structure (domain.com/zh_CN/...)
            // If that fails, the button won't work in local single-folder preview,
            // but will work in production or multi-folder preview.
            
            // Let's handle the "no language code" case by injecting /en/ 
            // This works if we are at root and want to go to /en/
            // e.g. domain.com/ -> domain.com/en/
            if (currentPath === '/' || currentPath === '/index.html') {
                 newPath = '/en' + currentPath;
            } else {
                 // Try to prepend /en/
                 newPath = '/en' + currentPath;
            }
        }
    }

    // Create the button
    var btn = document.createElement('a');
    btn.href = newPath;
    btn.className = 'language-switcher';
    btn.innerText = label;
    
    // Append to body (floating)
    document.body.appendChild(btn);
});
