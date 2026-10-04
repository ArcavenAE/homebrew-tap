class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.103454.2e5c3ba"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-103454-2e5c3ba/marvel-darwin-arm64"
    sha256 "453d94d238e1cc27d5d6a72a1db8986287895bd2b2a4013b7e001aa7a240bcc8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-103454-2e5c3ba/marvel-darwin-amd64"
    sha256 "f8dee0cb82608805e90fd45c74f4bb4634f75e66ea4d59f455ea0cfd74e24bd4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-103454-2e5c3ba/marvel-linux-arm64"
    sha256 "0688299409b76548c3b72b4fcde6a73a30d3fcaeff867d6b22babc22602a4be7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-103454-2e5c3ba/marvel-linux-amd64"
    sha256 "62b75da6087d7f27d12b91e0ad296d690ab05854efdaae3b0699249606095157"
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
