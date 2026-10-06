class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.194940.31b8c24"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-194940-31b8c24/marvel-darwin-arm64"
    sha256 "bbbf609a607be5e43b4906e81ab1c772e1fbf18901f513b99128b57908ebe8e4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-194940-31b8c24/marvel-darwin-amd64"
    sha256 "22d59356266b5829ee90003bccebaae8f084b037845ebc57f8df44597a4310c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-194940-31b8c24/marvel-linux-arm64"
    sha256 "375b08a631b61fb11878cf6ce3243c5e5464325dd7264884d78e1012ad807fe8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-194940-31b8c24/marvel-linux-amd64"
    sha256 "cc9ec770883238ccc786de794a613e1b7653b3b887903e1a5f47a1bef016b990"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
