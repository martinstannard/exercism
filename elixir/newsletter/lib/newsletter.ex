defmodule Newsletter do
  def read_emails(path) do
    {:ok, content} = File.read(path)
    do_read_emails(content)
  end

  def open_log(path) do
    {:ok, pid} = File.open(path, [:read, :write])
    pid
  end

  def log_sent_email(pid, email) do
    IO.write(pid, "#{email}\n")
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = read_emails(emails_path)
    log_file = open_log(log_path)
    emails
    |> Enum.map(fn(address) ->
      email_sent = send_fun.(address)
      log_sent(email_sent, log_file, address)
    end)
    close_log(log_file)
    :ok
  end

  defp log_sent(:ok, log_file,  address) do
      log_sent_email(log_file, address)
  end

  defp log_sent(_, _, _) do
    :ok
  end

  defp do_read_emails(""), do: []
  defp do_read_emails(content) do
    content
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
  end
end
