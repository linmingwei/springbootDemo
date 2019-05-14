package com.springboot.demo;

import com.springboot.demo.util.ahocorasick.trie.Emit;
import com.springboot.demo.util.ahocorasick.trie.Trie;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Auther: mingweilin
 * @Date: 5/14/2019 11:14
 * @Description:
 */
public class ACTest {
    @Test
    public void acUniTest() {
        String text = "基于Java实现AhoCorasick自动机框架";
        Set<String> words = new HashSet<>();
        words.add("基于");
        words.add("AhoCorasick");
        words.add("自动机");


        Trie trie = new Trie(false);
        for (String word : words) {
            trie.addKeyword(word);
        }

        Collection<Emit> emits = trie.parseText(text);
        for (Emit emit : emits) {
            System.out.println(emit);
        }
    }

    @Test
    public void acAscTest() {
        String text = "Hello world, Hello java.";
        Set<String> words = new HashSet<>();
        words.add("Hello");
        words.add("World");
        words.add("java");


        Trie trie = new Trie(false);
        for (String word : words) {
            trie.addKeyword(word);
        }
        Collection<Emit> emits = trie.parseText(text);
        for (Emit emit : emits) {
            System.out.println(emit);
        }
    }

    @Test
    public void sensitiveWord() throws IOException {
        Trie trie = new Trie(false);
        File file = new File(".");
        System.out.println(file.getAbsolutePath());
        Path txt = Paths.get("D:\\ideaProject\\springbootDemo\\src\\main\\java\\com\\springboot\\demo\\util\\ahocorasick\\keywords.txt");
        List<String> strings = Files.readAllLines(txt);
        for (String s : strings) {
            trie.addKeyword(s);
        }
        String text = "这种算法不太容易理解，网上有很多解释，但读起来都很费劲。直到读到Jake Boxer的文章，我才真正理解这种算法。下面，我用自己的语言，试图写一篇比较好懂的KMP算法解释。别老是去夜总会";
        Collection<Emit> emits = trie.parseText(text);
        for (Emit emit : emits) {
            System.out.println(emit);
        }

    }
}
