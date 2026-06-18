import 'dart:io';

void main() {
  final dir = Directory('lib');
  if (!dir.existsSync()) {
    print('lib directory not found.');
    return;
  }
  
  int replacedCount = 0;
  dir.listSync(recursive: true).forEach((entity) {
    if (entity is File && entity.path.endsWith('.dart')) {
      String content = entity.readAsStringSync();
      String original = content;
      
      int index;
      while (true) {
        index = content.indexOf('.withOpacity(');
        if (index == -1) break;
        
        int startOfArgs = index + '.withOpacity('.length;
        int depth = 1;
        int endOfArgs = startOfArgs;
        
        while (depth > 0 && endOfArgs < content.length) {
          if (content[endOfArgs] == '(') {
            depth++;
          } else if (content[endOfArgs] == ')') {
            depth--;
          }
          endOfArgs++;
        }
        
        if (depth == 0) {
          String args = content.substring(startOfArgs, endOfArgs - 1);
          String replacement = '.withValues(alpha: $args)';
          content = content.replaceRange(index, endOfArgs, replacement);
          replacedCount++;
        } else {
          // If we fail to parse, break to avoid infinite loop
          print('Error parsing withOpacity in ${entity.path} at index $index');
          break;
        }
      }
      
      if (content != original) {
        entity.writeAsStringSync(content);
        print('Updated: ${entity.path}');
      }
    }
  });
  print('Done! Replaced $replacedCount occurrences.');
}
