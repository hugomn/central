import { AppProps } from 'next/app';
import Head from 'next/head';
import { FC } from 'react';
import { ContextProvider } from '../contexts/ContextProvider';
import { AppBar } from '../components/AppBar';
import { ContentContainer } from '../components/ContentContainer';
import { Footer } from '../components/Footer';
import Notifications from '../components/Notification'
import { ApolloProvider } from "@apollo/client";
import client from "../lib/apollo-client";

require('@solana/wallet-adapter-react-ui/styles.css');
require('../styles/globals.css');

const App: FC<AppProps> = ({ Component, pageProps }) => {
    return (
        <>
          <Head>
            <title>Solana Scaffold Lite</title>
          </Head>
          <ApolloProvider client={client}>
            <ContextProvider>
              <div className="flex flex-col h-screen">
                <Notifications />
                <AppBar/>
                <ContentContainer>
                  <Component {...pageProps} />
                </ContentContainer>
                <Footer/>
              </div>
            </ContextProvider>
          </ApolloProvider>
        </>
    );
};

export default App;
