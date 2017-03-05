;; main
(progn
  (let ((output-buffer (get-buffer-create "analysis_ouput"))
        (input-path "/Users/tom-liang/Documents/scripts/test-color-for-emacs.py"))
    (with-temp-file input-path
      (insert-file-contents input-path)
      (>= (word-count-for-tasks "import") 2)
      (replace-string "import" "IMPORT")))))

(defun word-count-for-tasks (&rest tasks)
  "count words in a given path using while"
  (let ((task-count 0))
    (while tasks
      (let ((count (count-matches (car tasks)
                                  (point-min)
                                  (point-max))))
        (setq task-count (+ task-count count))
        (setq tasks (cdr tasks))))
    task-count))
