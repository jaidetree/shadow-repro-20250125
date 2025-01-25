(ns demo.core
  (:require
   [cljs.test :refer-macros [deftest is]]))

(deftest demo
  (is (= "b" (subs "abcde" 1 2)) "Control example")
  (is (thrown? (subs nil 1 2)) "Should have thrown"))
