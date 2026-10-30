class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.222348.fc8db7f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222348-fc8db7f/marvel-darwin-arm64"
    sha256 "72d8c3e3fdce516c2e86aa08112ce192e69e1cb19bc11d63d8b29af1a4083372"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222348-fc8db7f/marvel-darwin-amd64"
    sha256 "a6ed8dad8df04c54c55dbc41cee789a138b30a534b454dc234617707ac12ba63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222348-fc8db7f/marvel-linux-arm64"
    sha256 "e852753073e9f1bb6c6d50e94d94750158aa47ed584bbd767cde19ea6e5740d2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222348-fc8db7f/marvel-linux-amd64"
    sha256 "7100e327a3ebffefb89caf041826a3d3e3e31d9cf77df59c1e21d49920da318d"
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
